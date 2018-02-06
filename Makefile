TGT_DIR=target
SRC_DIR=src
TARGET=$(TGT_DIR)/startup.elf
OBJ := $(addprefix $(TGT_DIR)/, vector_table.o) # main.o
LDSCRIPT=$(SRC_DIR)/startup.ld
CROSS=arm-none-eabi-
# CFLAGS := -nostdlib -g -mcpu=cortex-m4 -mthumb -march=armv7e-m
LDFLAGS := -g
ASMFLAGS := -g

all: $(TARGET)

$(TGT_DIR)/%.o: $(SRC_DIR)/%.s | $(TGT_DIR)
	$(CROSS)as $(ASMFLAGS) -o $@ $<

$(TGT_DIR)/%.o: $(SRC_DIR)/%.c | $(TGT_DIR)
	$(CROSS)gcc $(CFLAGS) -c $<

$(TARGET): $(OBJ) $(LDSCRIPT) | $(TGT_DIR)
	$(CROSS)ld $(LDFLAGS) -o $@ -T $(LDSCRIPT) $(OBJ)

$(TGT_DIR):
	mkdir -p $(TGT_DIR)

clean:
	$(RM) $(TGT_DIR)/*.o $(TGT_DIR)/*.elf

debug: $(TARGET)
	$(CROSS)gdb -x gdbinit
