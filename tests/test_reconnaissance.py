import pytest
import subprocess
import os

def test_reconnaissance():
    result = subprocess.run(['./modules/reconnaissance/recon.sh', 'example.com', 'output'], capture_output=True, text=True)
    assert result.returncode == 0
    assert "Reconnaissance completed" in result.stdout

    # Check if expected output files are created
    expected_files = [
        'output/recon_subfinder.txt',
        'output/recon_amass.txt',
        'output/recon_assetfinder.txt',
        'output/recon_shuffledns.txt'
    ]
    for file in expected_files:
        assert os