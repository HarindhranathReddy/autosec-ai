# AutoSecAI-Plus

AutoSecAI-Plus is an advanced AI-enhanced web security scanner and exploitation tool. The tool automates reconnaissance, vulnerability scanning, and exploitation using the best available bug bounty tools. It is modular, scalable, and integrates AI-powered payload generation.

## Features

- Automated reconnaissance, vulnerability scanning, and exploitation
- AI-powered payload generation using OpenAI API or similar
- Modular and scalable architecture
- Detailed reporting in JSON, HTML, and Markdown formats

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have a Linux machine.
- You have Python 3.x installed. [Python Installation Guide](https://www.python.org/downloads/)
- You have `pip` installed. [Pip Installation Guide](https://pip.pypa.io/en/stable/installation/)

## Installation

Follow these steps to set up AutoSecAI-Plus on your local machine:

### Step 1: Clone the Repository

Clone the repository to your local machine using the following command:

```bash
git clone https://github.com/your-username/AutoSecAI-Plus.git
cd AutoSecAI-Plus
```

### Step 2: Run the Setup Script

Run the setup script to install all dependencies and required tools:

```bash
./setup.sh
```

### Step 3: Configure the Application

Update the `config.yaml` file with your specific configurations, including your OpenAI API key:

```yaml
ai_payloads:
  api_key: "your_openai_api_key_here"
  model: "text-davinci-003"
  prompt_template: "Generate attack payloads for domain {domain}"
```

## Usage

You can use AutoSecAI-Plus for a full scan or modular execution.

### Full Scan

To run a full scan, use the following command:

```bash
./AutoSecAI-Plus.sh -d example.com --full-scan
```

### Modular Execution

You can also run each module individually:

#### Reconnaissance

```bash
./AutoSecAI-Plus.sh -d example.com --recon
```

#### Scanning

```bash
./AutoSecAI-Plus.sh -d example.com --scan
```

#### Exploitation

```bash
./AutoSecAI-Plus.sh -d example.com --exploit
```

#### AI-Powered Payload Generation

```bash
./AutoSecAI-Plus.sh -d example.com --ai-payload
```

#### Reporting

```bash
./AutoSecAI-Plus.sh -d example.com --report
```

## Contributing

We welcome contributions! Please read [contributions.md](contributions.md) for guidelines on open-source contributions.

## License

This project is licensed under the MIT License.