import pytest
import subprocess
import os

def test_scanning():
    result = subprocess.run(['./modules/scanning/scan.sh', 'example.com', 'output'], capture_output=True, text=True)
    assert result.returncode == 0
    assert "Scanning completed" in result.stdout

    # Check if expected output files are created
    expected_files = [
        'output/scan_masscan.xml',
        'output/scan_nmap.txt',
        'output/scan_naabu.txt'
    ]
    for file in expected_files:
        assert os.path.isfile(file)
