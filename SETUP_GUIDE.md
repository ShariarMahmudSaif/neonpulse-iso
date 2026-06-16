# 🛠️ NeonPulse OS - ISO Compiling & Distribution Manual

This technical manual details the foundational environment preparation, compilation pipelines, and secure extraction bridges required to compile the **NeonPulse OS** distribution installer image from source.

---

## 🖥️ Hardware Profile Requirements

The compilation matrix requires heavy package isolation, compilation extraction loops, and high-velocity squashfs compression. Ensure your host system meets these structural bounds before triggering the compilation script:

| Resource Dimension | Minimum Baseline Specs | Recommended Performance Grid |
| :--- | :--- | :--- |
| 🧠 **System Memory (RAM)** | 4 GB | 8 GB |
| 🎛️ **Processing Power** | 4 CPU Cores | 6 CPU Cores |
| 💾 **Drive Space (Disk Pool)** | 50 GB | 128 GB Persistent Storage |

---

## ⚡ Processor Optimization Profiles (Intel vs. AMD)

Before provisioning your virtual environment, ensure your host computer's motherboard has hardware virtualization flags activated in the BIOS/UEFI layer.

### 🔷 For Intel Core/Xeon Processors
*   **Motherboard BIOS Option:** Turn on **Intel Virtualization Technology (Intel VT-x)** and **VT-d**.
*   **VirtualBox VM Configuration:** Navigate to *Settings -> System -> Processor* and check the box for **Enable PAE/NX**. Under *Acceleration*, ensure paravirtualization is mapped to **KVM** or **Default**.

### 🟩 For AMD Ryzen/EPYC Processors
*   **Motherboard BIOS Option:** Turn on **SVM Mode** (Secure Virtual Machine) or **AMD-V**.
*   **VirtualBox VM Configuration:** Under *Settings -> System -> Processor*, assign your dedicated core boundaries (4 to 6 cores). Ryzen's multi-threading structure executes high-speed compilation routines automatically inside the virtual sandbox.

---

## 🏗️ Phase 1: Environment & Sandbox Provisioning

Because raw live RAM filesystems lack sufficient headroom to process heavy package generation trees, you must map all workspace procedures straight onto your persistent virtual hard drive device. Run these allocation commands line-by-line:

```bash
# 1. Initialize a clean GPT signature on the primary hard disk container
sfdisk /dev/sda <<< "label: gpt"

# 2. Carve out a primary persistent partition workspace slice
sfdisk /dev/sda <<< ", ,"

# 3. Format the new partition space into a clean Linux ext4 framework
mkfs.ext4 /dev/sda1

# 4. Map the physical partition drive straight to the system path
mount /dev/sda1 /mnt

# 5. Provision the pacman package and tracking database directories on the disk
mkdir -p /mnt/var/lib/pacman /mnt/var/cache/pacman/pkg

# 6. Install the development tools directly onto the spacious partition space
pacman -Sy --confirm --root /mnt --cachedir /mnt/var/cache/pacman/pkg git base-devel archiso
```

---

## 🚀 Phase 2: Compilation Loop Execution

1. Step out of the temporary live layout jail environment for a brief moment to map working network mirrors straight into your drive space:
   ```bash
   exit
   cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
   ```
2. Step back inside your dedicated drive workspace sandbox jail:
   ```bash
   arch-chroot /mnt
   ```
3. Enter your project workspace folder, grant executable rights, and launch the compiler script:
   ```bash
   cd neonpulse-iso
   chmod +x build.sh
   ./build.sh
   ```

---

## 📥 Phase 3: Secure ISO Extraction to Windows Host

Because text-only CLI shells do not contain a graphical clipboard engine, default VirtualBox shared folder/clipboard hooks are unavailable. Use this secure network terminal bridge to pull your completed installer image directly onto your real Windows Desktop frame:

### 1. Enable Secure Remote Sharing Inside the VM Terminal:
```bash
passwd root
systemctl start sshd
ip a
```
*(Note down the local `inet` network IP address number string, for example: `192.168.1.50`).*

### 2. Pull the File from Your Windows Terminal Matrix:
Open a standard **Windows Command Prompt (`cmd`)** or **PowerShell** window on your physical machine, replace `YOUR_VM_IP` with your noted number string, and execute:

```cmd
scp root@YOUR_VM_IP:/mnt/out/neonpulse-1.0.0-x86_64.iso %USERPROFILE%\Desktop\
```
3. Type **`yes`** if prompted to verify host key signatures, then input the root password you created in Step 1. Your customized **`neonpulse-1.0.0-x86_64.iso`** file will download straight onto your physical Windows Desktop screen!
