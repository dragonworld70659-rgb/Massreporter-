# 🧊 Telegram Mass Reporter & Freeze Engine v2.0

This is a high-performance, asynchronous Python-based tool designed to send mass reports to Telegram targets (users/channels/groups) using multiple bot tokens and rotating proxies.

---

# 📁 Project Structure

Ensure you have these 6 files in your project folder:

1. `freezer.py` — The main reporting engine  
2. `config.yaml` — Central configuration and target settings  
3. `proxy_fetcher.py` — Automatic proxy scraper and tester  
4. `setup.sh` — Automation script for Linux/VPS  
5. `bots.json` — Storage for your Telegram Bot API tokens  
6. `README.md` — This instruction manual  

---

# 🚀 Local Setup (Windows / PC)

## 1. Install Requirements

```bash
pip install aiohttp pyyaml rich fake-useragent
```

## 2. Configure Bots

Edit bots.json: [ ⚠️ USE MINIMUM 10-15 BOTS ] 

```json
{
  "tokens": [
    "123456789:ABCDEF...",
    "987654321:XYZABC..."
  ]
}
```

## 3. Run the Bot

```bash
python proxy_fetcher.py
python freezer.py
```

---

# ☁️ VPS Deployment Guide (Linux / Ubuntu)

## Step 1: Update & Install Python

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install python3 python3-pip git -y
```

## Step 2: Setup Project

```bash
mkdir massreporter
cd massreporter
# Upload your files here
```

## Step 3: Run Setup Script

```bash
chmod +x setup.sh
./setup.sh
```

## Step 4: Run in Background (Screen)

```bash
screen -S reporter
python3 freezer.py
```

Detach:
```
CTRL + A + D
```

Reattach:
```bash
screen -r reporter
```

---

# ⚙️ Configuration (config.yaml)

| Setting | Description | Recommended |
|--------|------------|------------|
| reports_per_target | Total reports to send | 3000+ |
| delay_min | Minimum delay (sec) | 0.5 |
| delay_max | Maximum delay (sec) | 1.5 |
| targets | List of @usernames | Edit as needed |

---

# ⚠️ Disclaimer & Safety

- ⚠️ Flood Wait: Use at least 10–20 bots  
- 🌐 Proxy Health: Always run proxy_fetcher.py before starting  
- 📚 Educational Purpose Only  

---

# ⭐ Features

- ⚡ Async high-speed reporting  
- 🔁 Proxy rotation system  
- 🤖 Multi-bot support  
- 🖥️ VPS optimized  

--- 

