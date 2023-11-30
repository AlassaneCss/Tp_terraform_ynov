import subprocess
import sys

nom_repo = sys.argv[1]

subprocess.run(["terraform", "init"])
subprocess.run(["terraform", "apply", "-auto-approve", f"-var=nom_du_repo={nom_repo}"])
