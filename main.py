import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)

import sys
from PyQt5.QtWidgets import QApplication
from ui_mainWindow import MainWindow

def main():
    filename = sys.argv[1] if len(sys.argv) > 1 else ""
    app = QApplication(sys.argv)
    window = MainWindow(filename)
    window.show()
    sys.exit(app.exec_())

if __name__ == "__main__":
    main()


