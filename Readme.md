# 🧊 Telegram Mass Reporter & Freeze Engine v2.0
💪 This is a high-performance, asynchronous Python-based tool designed to send mass reports to Telegram targets (users/channels/groups) using multiple bot tokens and rotating proxies to "freeze" or flag them.

# 📁 Project Structure
Ensure you have these 6 files in your project folder:

   1. `freezer.py` — The main reporting engine.
   2. `config.yaml` — Central configuration and target settings.
   3. `proxy_fetcher.py` — Automatic proxy scraper and tester.
   4. `setup.sh` — Automation script for Linux/VPS.
   5. `bots.json` — Storage for your Telegram Bot API tokens.
   6. `README.md` — This instruction manual.

# 🚀 Local Setup (Windows/PC)1. Install Requirements
Open your terminal or CMD and run:

pip install aiohttp pyyaml rich fake-useragent

2. Configure Bots
Open bots.json and add your bot tokens from @BotFather:

{
  "tokens": [
    "123456789:ABCDEF...",
    "987654321:XYZABC..."
  ]
}

3. Run the Bot
First, fetch fresh proxies:

python proxy_fetcher.py

Then, start the mass reporting:

python freezer.py
