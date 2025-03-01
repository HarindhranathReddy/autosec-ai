import pytest
import subprocess
import os

def test_reporting():
    result = subprocess.run(['./modules/reporting/report.sh', 'example.com', 'output'], capture_output=True, text=True)
    assert result.returncode == 0
    assert "Report generation completed" in result.stdout

    # Check if expected output files are created
    expected_files = [
        'output/example.com_report.json',
        'output/example.com_report.html',
        'output/example.com_report.md'
    ]
    for file in expected_files:
        assert os.path.isfile(file)