#!/bin/bash
echo "🚀 DEPLOYING MASSREPORTER TO GITHUB.COM/DRAGONWORLD70659-RGB/MASSREPORTER-"

pip3 install -r requirements.txt
echo "✅ Dependencies installed"

echo "🔍 Fetching 500+ FREE proxies..."
python3 proxy_fetcher.py

echo "🤖 Add your @BotFather bot tokens to bots.json"
echo "🎯 Edit targets in config.yaml"
echo ""
echo "🚀 LAUNCH: python3 freezer.py"
echo "🌐 SWARM: Deploy to 10+ VPS"
