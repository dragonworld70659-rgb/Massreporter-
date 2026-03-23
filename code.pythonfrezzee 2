#!/usr/bin/env python3
import asyncio
import aiohttp
import random
import yaml
import json
from rich.console import Console
from rich.progress import Progress
from fake_useragent import UserAgent

console = Console()
ua = UserAgent()

class UltimateFreezer:
    def __init__(self):
        with open('config.yaml') as f:
            self.cfg = yaml.safe_load(f)
        with open(self.cfg['bots_file'], 'r') as f:
            self.bots_data = json.load(f)
        self.bots = self.bots_data['tokens']
        self.proxies = self.cfg['proxies']
    
    async def get_proxy(self):
        return random.choice(self.proxies) if self.proxies else None
    
    async def report(self, bot_token, target):
        url = f"https://api.telegram.org/bot{bot_token}/reportChat"
        reasons = ['fake', 'spam', 'scam', 'violence', 'pornography', 'copyright']
        
        payload = {
            'chat_id': target,
            'reason': random.choice(reasons),
            'message_ids': [str(random.randint(1, 999999))]
        }
        
        proxy = await self.get_proxy()
        headers = {'User-Agent': ua.random}
        
        try:
            timeout = aiohttp.ClientTimeout(total=10)
            async with aiohttp.ClientSession(timeout=timeout, headers=headers) as session:
                async with session.post(url, json=payload, proxy=proxy) as resp:
                    return resp.status == 200
        except:
            return False
    
    async def freeze_target(self, target):
        max_reports = self.cfg['reports_per_target']
        success_count = 0
        
        with Progress() as progress:
            task = progress.add_task(f"[cyan]🧊 Freezing {target}", total=max_reports)
            
            for i in range(max_reports):
                bot = random.choice(self.bots)
                if await self.report(bot, target):
                    success_count += 1
                progress.update(task, advance=1)
                await asyncio.sleep(random.uniform(self.cfg['delay_min'], self.cfg['delay_max']))
        
        return success_count
    
    async def launch_swarm(self):
        console.print("🚀 [bold red]ULTIMATE FREEZE SWARM ACTIVATED[/bold red]")
        console.print(f"🤖 [yellow]{len(self.bots)}[/yellow] bots | 🌐 [yellow]{len(self.proxies)}[/yellow] proxies")
        
        tasks = [self.freeze_target(target) for target in self.cfg['targets']]
        results = await asyncio.gather(*tasks)
        
        # Results
        for target, reports in zip(self.cfg['targets'], results):
            status = "🧊 FULL FREEZE" if reports > 2000 else f"🔥 {reports} reports"
            console.print(f"[bold green]{target}: {reports} ➤ {status}[/bold green]")

async def main():
    freezer = UltimateFreezer()
    await freezer.launch_swarm()

if __name__ == "__main__":
    asyncio.run(main())
