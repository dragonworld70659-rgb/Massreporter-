#!/usr/bin/env python3
import aiohttp
import asyncio
import random
import yaml
from rich.console import Console

console = Console()

PROXY_APIS = [
    "https://api.proxyscrape.com/v2/?request=get&protocol=http&timeout=10000&country=all&ssl=all&anonymity=all",
    "https://raw.githubusercontent.com/TheSpeedX/PROXY-List/master/http.txt",
    "https://raw.githubusercontent.com/hookzof/socks5_list/master/proxy.txt",
    "https://www.proxy-list.download/api/v1/get?type=http",
    "https://raw.githubusercontent.com/monosans/proxy-list/main/proxies/http.txt",
    "https://raw.githubusercontent.com/jetkai/proxy-list/main/online-proxies/txt/proxies-http.txt"
]

async def fetch_proxies():
    proxies = set()
    async with aiohttp.ClientSession() as session:
        for url in PROXY_APIS:
            try:
                async with session.get(url, timeout=aiohttp.ClientTimeout(10)) as resp:
                    if resp.status == 200:
                        text = await resp.text()
                        for line in text.strip().split('\n'):
                            line = line.strip()
                            if ':' in line and len(line.split(':')) == 2:
                                proxies.add(line)
            except:
                continue
    return list(proxies)

async def test_proxy(proxy):
    try:
        async with aiohttp.ClientSession(timeout=aiohttp.ClientTimeout(7)) as session:
            async with session.get("http://httpbin.org/ip", proxy=f"http://{proxy}") as resp:
                return resp.status == 200
    except:
        return False

async def main():
    console.print("🔍 [bold]Fetching 20k+ FREE proxies...[/bold]")
    all_proxies = await fetch_proxies()
    console.print(f"📡 Found [green]{len(all_proxies)}[/green] proxies")
    
    # Test top 2000 for speed
    test_proxies = random.sample(all_proxies, min(2000, len(all_proxies)))
    console.print("✅ Testing live proxies...")
    
    tasks = [test_proxy(p) for p in test_proxies]
    results = await asyncio.gather(*tasks)
    
    working = [p for p, ok in zip(test_proxies, results) if ok]
    
    console.print(f"🎉 [bold green]{len(working)}[/bold green] LIVE PROXIES READY!")
    
    # Update config.yaml
    config = {
        "proxies": working[:500],
        "targets": ["@target1", "@target2"],  # Edit here
        "reports_per_target": 3000,
        "delay_min": 0.5,
        "delay_max": 1.5
    }
    
    with open("config.yaml", "w") as f:
        yaml.dump(config, f)
    
    console.print("💾 [bold green]config.yaml UPDATED - 500+ PROXIES LOADED![/bold green]")
    print("\n📋 PROXIES:", working[:10])  # Show sample

if __name__ == "__main__":
    asyncio.run(main())
