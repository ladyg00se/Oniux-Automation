# 🧅 Oniux Autostart Script (Linux)

This setup ensures that selected applications always run over the Tor network using [Oniux](https://gitlab.torproject.org/tpo/core/oniux) when your Linux system starts.

## 🚀 What is Oniux?

Oniux is a small CLI tool that isolates any Linux application at the kernel level using Linux namespaces and routes all traffic securely through the Tor network. Unlike `torsocks`, Oniux prevents leaks by isolating the entire network environment, making it impossible for apps to bypass Tor unintentionally.

## 🛠️ How It Works

- A script (`oniux-autostart.sh`) reads a list of commands from `/programs/list.txt`.
- Each command is executed using `oniux`, ensuring it's fully routed through Tor.
- The script runs automatically at system startup via the user's `crontab`.

## 📋 File Structure

```
/programs/list.txt               # List of commands to run over Tor
/usr/local/bin/oniux-autostart.sh  # Main script to launch them
```

## 📄 Sample list.txt

```text
# Each line is a command to run with Oniux
firefox
curl https://icanhazip.com
gnome-terminal -- bash
```

## ⚙️ Setup Instructions

1. **Install Oniux (requires Rust toolchain):**
   ```bash
   cargo install --git https://gitlab.torproject.org/tpo/core/oniux oniux@0.4.0
   ```

2. **Create script:**
   Save `oniux-autostart.sh` to:
   ```bash
   /usr/local/bin/oniux-autostart.sh
   chmod +x /usr/local/bin/oniux-autostart.sh
   ```

3. **Create program list file:**
   ```bash
   sudo mkdir -p /programs
   sudo nano /programs/list.txt
   ```

4. **Add to crontab:**
   ```bash
   crontab -e
   ```

   Then add:
   ```bash
   @reboot /usr/local/bin/oniux-autostart.sh
   ```

5. **Reboot and verify.**

## ✅ Notes

- Make sure all listed commands are available in your PATH.
- Oniux is Linux-only and experimental but powerful for privacy-focused setups.

---

🔒 Stay private. Stay anonymous. Personal use.
