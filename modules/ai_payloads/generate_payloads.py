import openai
import sys
import yaml
import argparse

def load_config():
    with open("config.yaml", "r") as file:
        return yaml.safe_load(file)

def generate_payloads(domain, api_key, model, prompt_template):
    openai.api_key = api_key
    prompt = prompt_template.format(domain=domain)
    response = openai.Completion.create(
        model=model,
        prompt=prompt,
        max_tokens=100
    )
    return response.choices[0].text.strip()

def main():
    parser = argparse.ArgumentParser(description='Generate AI-powered payloads')
    parser.add_argument('--domain', type=str, required=True, help='Target domain')
    parser.add_argument('--output', type=str, required=True, help='Output directory')
    args = parser.parse_args()
    
    config = load_config()
    api_key = config['ai_payloads']['api_key']
    model = config['ai_payloads']['model']
    prompt_template = config['ai_payloads']['prompt_template']
    payloads = generate_payloads(args.domain, api_key, model, prompt_template)
    with open(f"{args.output}/{args.domain}_payloads.txt", "w") as file:
        file.write(payloads)
    print(f"AI-generated payloads saved to {args.output}/{args.domain}_payloads.txt")

if __name__ == "__main__":
    main()
    
