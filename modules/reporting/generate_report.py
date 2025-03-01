import json
import os
import sys
import yaml
import argparse
from jinja2 import Environment, FileSystemLoader

def load_config():
    with open("config.yaml", "r") as file:
        return yaml.safe_load(file)

def load_scan_results(domain, output_directory):
    results = {}
    for tool in ['subfinder', 'amass', 'assetfinder', 'shuffledns', 'masscan', 'nmap', 'naabu', 'sqlmap', 'xsstrike', 'commix', 'lfisuite', 'smuggler', 'race-the-web']:
        path = f"{output_directory}/{tool}_{domain}.txt"
        if os.path.exists(path):
            with open(path, "r") as file:
                results[tool] = file.read()
    return results

def generate_json_report(domain, results, output_directory):
    with open(f"{output_directory}/{domain}_report.json", "w") as file:
        json.dump(results, file, indent=4)

def generate_html_report(domain, results, output_directory):
    env = Environment(loader=FileSystemLoader('templates'))
    template = env.get_template('report.html')
    html_content = template.render(domain=domain, results=results)
    with open(f"{output_directory}/{domain}_report.html", "w") as file:
        file.write(html_content)

def generate_md_report(domain, results, output_directory):
    with open(f"{output_directory}/{domain}_report.md", "w") as file:
        file.write(f"# Report for {domain}\n")
        for tool, result in results.items():
            file.write(f"## {tool}\n```\n{result}\n```\n")

def main():
    parser = argparse.ArgumentParser(description='Generate reports')
    parser.add_argument('--domain', type=str, required=True, help='Target domain')
    parser.add_argument('--output', type=str, required=True, help='Output directory')
    args = parser.parse_args()

    config = load_config()
    results = load_scan_results(args
