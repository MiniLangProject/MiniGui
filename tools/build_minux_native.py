"""Build the MiniGui native MinUX desktop bridge, without modifying MinUX."""
from pathlib import Path
import argparse
import subprocess

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--minux-root',type=Path,required=True)
    parser.add_argument('--output',type=Path,default=ROOT/'build/native/minux-x64')
    args=parser.parse_args()
    root, output=args.minux_root.resolve(),args.output.resolve()
    output.mkdir(parents=True,exist_ok=True)
    obj=output/'minigui_minux.o'
    subprocess.run(['g++','-std=c++17','-O2','-fPIC','-fno-exceptions','-fno-rtti',
        '-fno-stack-protector','-I'+str(root/'include'),'-I'+str(root/'sdk/include'),
        '-c',str(ROOT/'native/minux/minigui_minux.cpp'),'-o',str(obj)],check=True)
    subprocess.run(['ld','-shared','--build-id=none','--hash-style=sysv','-z','max-page-size=4096',
        '-soname','libminigui_minux.so','-T',str(root/'user/shared_library.ld'),
        '-o',str(output/'libminigui_minux.so'),str(obj),'-L'+str(root/'obj/user'),'-l:libc.so.1'],check=True)
    print('MinUX MiniGui bridge built:',output/'libminigui_minux.so')


if __name__=='__main__':main()
