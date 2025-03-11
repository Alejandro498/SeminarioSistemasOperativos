#!/bin/bash

# Verificar si se proporcionaron los argumentos necesarios
if [ "$#" -ne 8 ]; then
  echo "Uso: $0 <nombre_vm> <tipo_os> <num_cpus> <memoria_ram_mb> <memoria_vram_mb> <tamano_disco_gb> <nombre_controlador_sata> <nombre_controlador_ide>"
  exit 1
fi

# Argumentos
NOMBRE_VM=$1
TIPO_OS=$2
NUM_CPUS=$3
MEMORIA_RAM_MB=$4
MEMORIA_VRAM_MB=$5
TAMANO_DISCO_GB=$6
NOMBRE_CONTROLADOR_SATA=$7
NOMBRE_CONTROLADOR_IDE=$8

# Crear la máquina virtual
VBoxManage createvm --name "$NOMBRE_VM" --ostype "$TIPO_OS" --register

# Configurar la máquina virtual
VBoxManage modifyvm "$NOMBRE_VM" --cpus "$NUM_CPUS" --memory "$MEMORIA_RAM_MB" --vram "$MEMORIA_VRAM_MB"

# Crear el disco duro virtual
VBoxManage createmedium disk --filename "$HOME/VirtualBox VMs/$NOMBRE_VM/$NOMBRE_VM.vdi" --size $(($TAMANO_DISCO_GB * 1024))

# Crear y asociar el controlador SATA
VBoxManage storagectl "$NOMBRE_VM" --name "$NOMBRE_CONTROLADOR_SATA" --add sata --controller IntelAhci
VBoxManage storageattach "$NOMBRE_VM" --storagectl "$NOMBRE_CONTROLADOR_SATA" --port 0 --device 0 --type hdd --medium "$HOME/VirtualBox VMs/$NOMBRE_VM/$NOMBRE_VM.vdi"

# Crear y asociar el controlador IDE
VBoxManage storagectl "$NOMBRE_VM" --name "$NOMBRE_CONTROLADOR_IDE" --add ide
VBoxManage storageattach "$NOMBRE_VM" --storagectl "$NOMBRE_CONTROLADOR_IDE" --port 1 --device 0 --type dvddrive --medium emptydrive

# Filtrar y mostrar la configuración de la máquina virtual
VBoxManage showvminfo "$NOMBRE_VM" --machinereadable | grep -E 'name|ostype|cpus|memory|vram|SATA|IDE|vdi'
