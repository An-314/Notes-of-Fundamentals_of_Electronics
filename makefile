# -------- Cross-platform helpers --------
ifeq ($(OS),Windows_NT)
  define MKDIR_P
    powershell -NoProfile -Command "New-Item -ItemType Directory -Force '$(1)' | Out-Null"
  endef
  define RM_RF
    powershell -NoProfile -Command "if (Test-Path '$(1)') { Remove-Item -Recurse -Force '$(1)' }"
  endef
else
  define MKDIR_P
    mkdir -p '$(1)'
  endef
  define RM_RF
    rm -rf '$(1)'
  endef
endif
# ----------------------------------------

# 基本变量
BUILD_DIR := builds

MAIN_SRC := main.typ
MAIN_PDF := $(BUILD_DIR)/main.pdf

CHAPS := $(wildcard chap*.typ)

# 主文档图片（由 pic/*.typ 预编译得到）
PIC_SRC := $(wildcard pic/*.typ)
PIC_PDF := $(patsubst pic/%.typ,pic/builds/%.pdf,$(PIC_SRC))

# HW 部分
HW_SRC := $(wildcard HW/*.typ)
HW_PDF := $(patsubst HW/%.typ,$(BUILD_DIR)/HW/%.pdf,$(HW_SRC))

# HW 图片（由 HW/pic/*.typ 预编译得到）
HW_PIC_SRC := $(wildcard HW/pic/*.typ)
HW_PIC_PDF := $(patsubst HW/pic/%.typ,HW/pic/builds/%.pdf,$(HW_PIC_SRC))

# Lab 部分
#
# Lab 与 HW 的目录结构不同：每个实验各有一个子目录，报告入口也有
# main.typ 和 report.typ 两种名字。因此不能像 HW 一样用单层通配符处理。
LAB_ROOT := Lab
LAB_BUILD_DIR := $(BUILD_DIR)/Lab

.PHONY: all lab clean publish ssh-test

all: $(PIC_PDF) $(HW_PIC_PDF) $(MAIN_PDF) $(HW_PDF) lab

# 编译主文档
$(MAIN_PDF): $(MAIN_SRC) $(CHAPS) $(PIC_PDF)
	$(call MKDIR_P,$(dir $@))
	typst compile $< $@

# 预编译主文档图片
pic/builds/%.pdf: pic/%.typ
	$(call MKDIR_P,$(dir $@))
	typst compile $< $@

# 预编译 HW 图片
HW/pic/builds/%.pdf: HW/pic/%.typ
	$(call MKDIR_P,$(dir $@))
	typst compile $< $@

# 编译每个 HW
$(BUILD_DIR)/HW/%.pdf: HW/%.typ $(HW_PIC_PDF)
	$(call MKDIR_P,$(dir $@))
	typst compile $< $@

# 编译各实验报告。
# 输出按实验目录命名，例如：
#   Lab/Lab 2/report.typ  -> builds/Lab/Lab 2.pdf
#   Lab/Lab 10/main.typ   -> builds/Lab/Lab 10.pdf
# 没有 Typst 报告源文件的实验目录会被跳过。
lab:
	$(call MKDIR_P,$(LAB_BUILD_DIR))
ifeq ($(OS),Windows_NT)
	@powershell -NoProfile -Command "$$ErrorActionPreference = 'Stop'; Get-ChildItem -LiteralPath '$(LAB_ROOT)' -Directory | Sort-Object Name | ForEach-Object { $$main = Join-Path $$_.FullName 'main.typ'; $$report = Join-Path $$_.FullName 'report.typ'; if (Test-Path -LiteralPath $$main) { $$src = $$main } elseif (Test-Path -LiteralPath $$report) { $$src = $$report } else { return }; $$out = Join-Path '$(LAB_BUILD_DIR)' ($$_.Name + '.pdf'); $$inputs = Get-ChildItem -LiteralPath $$_.FullName -Recurse -File | Where-Object { $$_.Extension -in '.typ', '.png', '.jpg', '.jpeg', '.svg' }; $$newest = $$inputs | Sort-Object LastWriteTime -Descending | Select-Object -First 1; if (!(Test-Path -LiteralPath $$out) -or $$newest.LastWriteTime -gt (Get-Item -LiteralPath $$out).LastWriteTime) { Write-Host ('编译 {0} -> {1}' -f $$src, $$out); & typst compile $$src $$out; if ($$LASTEXITCODE -ne 0) { exit $$LASTEXITCODE } } else { Write-Host ('已是最新：{0}' -f $$out) } }"
else
	@find '$(LAB_ROOT)' -mindepth 1 -maxdepth 1 -type d -exec sh -c '\
	  for lab_dir do \
	    if [ -f "$$lab_dir/main.typ" ]; then \
	      src="$$lab_dir/main.typ"; \
	    elif [ -f "$$lab_dir/report.typ" ]; then \
	      src="$$lab_dir/report.typ"; \
	    else \
	      continue; \
	    fi; \
	    lab_name=$${lab_dir##*/}; \
	    out="$(LAB_BUILD_DIR)/$$lab_name.pdf"; \
	    if [ ! -f "$$out" ] || \
	       find "$$lab_dir" -type f \( \
	         -name "*.typ" -o -name "*.png" -o -name "*.jpg" -o \
	         -name "*.jpeg" -o -name "*.svg" \
	       \) -newer "$$out" -print -quit | grep -q .; then \
	      printf "编译 %s -> %s\n" "$$src" "$$out"; \
	      typst compile "$$src" "$$out" || exit $$?; \
	    else \
	      printf "已是最新：%s\n" "$$out"; \
	    fi; \
	  done' sh {} +
endif

clean:
	$(call RM_RF,$(BUILD_DIR))
	$(call RM_RF,pic/builds)
	$(call RM_RF,HW/pic/builds)

-include ./notes.mk
