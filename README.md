# WSL-Ubuntu

## Needed:
- [Vcxsrv](https://sourceforge.net/projects/vcxsrv/)

## Remove sudo password:
```
echo "`whoami` ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/`whoami` && sudo chmod 0440 /etc/sudoers.d/`whoami`
```
