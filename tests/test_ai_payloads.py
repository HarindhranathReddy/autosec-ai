import pytest
import subprocess
import os

def test_ai_payloads():
    result = subprocess.run(['./modules/ai_payloads/ai_payload.sh', 'example.com', 'output'], capture_output=True, text=True)
    assert result.returncode == 0
    assert "AI-powered payload generation completed" in result.stdout

    # Check if expected output file is created
    expected_file = 'output/example.com_payloads.txt'
    assert os.path.isfile(expected_file)