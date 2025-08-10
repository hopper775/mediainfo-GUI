import sys
import qdarktheme
from PyQt5.QtWidgets import QMainWindow, QWidget, QVBoxLayout, QPushButton, QFileDialog, QMessageBox, QActionGroup, QAction, QWidgetAction
from PyQt5.QtCore import Qt, QSettings
from PyQt5.QtGui import QFont
from mediainfo_parser import get_mediainfo_data
from ui_tableWiget import tableWidget

class MainWindow(QMainWindow):
    def __init__ (self, filename):
        super().__init__()
        if filename:
            self.setWindowTitle (f"Mediainfo GUI - {filename}")
        else:
            self.setWindowTitle ("Mediainfo GUI")
        self.setMinimumHeight(700)
        self.setMinimumWidth(500)
        self.initUI(get_mediainfo_data(filename))

    def initUI(self, data):
        self.data = data
        self.settings = QSettings("hopper775", "mediainfogui")
        saved_font_size = self.settings.value("font_size")
        self.font_size = int(saved_font_size) if saved_font_size else 11 #font size if app runs first time, and no settings saved yet
        self.font = QFont("Noto sans", self.font_size)

        central_widget = QWidget()
        self.layout = QVBoxLayout()
        self.layout.setContentsMargins(4, 0, 4, 4)#left, top, right, bottom
        self.table_widget = tableWidget(self, data, self.font)
        self.layout.addWidget(self.table_widget)

        self.exit_butt = QPushButton("Exit", self)
        self.exit_butt.setFixedSize(100, 35)
        self.exit_butt.clicked.connect(self.close)
        self.layout.addWidget(self.exit_butt, alignment=Qt.AlignRight)

        central_widget.setLayout(self.layout)
        self.setCentralWidget(central_widget)
        light_action = QAction("Light theme", self, checkable=True)
        dark_action = QAction("Dark theme", self, checkable=True)
        auto_action = QAction("Auto", self, checkable=True)
        menuBar = self.menuBar()

        file_menu = menuBar.addMenu('File')
        file_menu.addAction("Open", self.open_file, "Ctrl+O")
        file_menu.addSeparator()
        file_menu.addAction("Exit", self.close, "Esc")
        appearance_menu = menuBar.addMenu("Appearance")
        theme_group = QActionGroup(self)
        theme_group.setExclusive(True)

        theme_group.addAction(light_action)
        theme_group.addAction(dark_action)
        theme_group.addAction(auto_action)

        light_action.triggered.connect(self.theme_light)
        dark_action.triggered.connect(self.theme_dark)
        auto_action.triggered.connect(self.theme_auto)

        appearance_menu.addAction(light_action)
        appearance_menu.addAction(dark_action)
        appearance_menu.addAction(auto_action)
        appearance_menu.addSeparator()
        
        inc_action = QWidgetAction(self)
        inc_btn = QPushButton("Increase font size")
        inc_btn.clicked.connect(self.font_size_plus)
        inc_action.setDefaultWidget(inc_btn)
        appearance_menu.addAction(inc_action)
        appearance_menu.addSeparator()

        dec_action = QWidgetAction(self)
        dec_btn = QPushButton("Reduce font size")
        dec_btn.clicked.connect(self.font_size_minus)
        dec_action.setDefaultWidget(dec_btn)
        appearance_menu.addAction(dec_action)
        match self.settings.value("theme"):
            case "light":
                qdarktheme.setup_theme("light")
                light_action.setChecked(True)
            case "dark":
                qdarktheme.setup_theme()
                dark_action.setChecked(True)
            case "auto":
                qdarktheme.setup_theme("auto")
                auto_action.setChecked(True)
            case _:
                qdarktheme.setup_theme("auto") #set theme to auto if app runs first time, and no settings saved yet
                auto_action.setChecked(True)
        about_menu = menuBar.addMenu("About")
        about_menu.addAction("About", self.show_about)

    def font_size_plus(self):
        self.font_size += 1 if self.font_size < 30 else 0
        self.settings.setValue("font_size", self.font_size)
        self.font = QFont("Noto sans", self.font_size)
        self.redraw_tabs()

    def font_size_minus(self):
        self.font_size -= 1 if self.font_size > 6 else 0
        self.settings.setValue("font_size", self.font_size)
        self.font = QFont("Noto sans", self.font_size)
        self.redraw_tabs()

    def redraw_tabs(self):
        self.layout.removeWidget(self.table_widget)
        self.table_widget.deleteLater()
        self.table_widget = tableWidget(self, self.data, self.font)
        self.layout.insertWidget(0, self.table_widget)

    def theme_light(self):
        qdarktheme.setup_theme("light")
        self.settings.setValue("theme", "light")
    def theme_dark(self):
        qdarktheme.setup_theme()
        self.settings.setValue("theme", "dark")
    def theme_auto(self):
        qdarktheme.setup_theme("auto")
        self.settings.setValue("theme", "auto")

    def show_about(self):
        msg_box = QMessageBox(self)
        msg_box.setWindowTitle("About")
        msg_box.setText(f"Simple alternative GUI for mediainfo application build using Python & PyQt5\nFont size: {self.font_size};\nHost OS: {sys.platform}.")
        msg_box.setIcon(QMessageBox.Icon.Information)
        msg_box.setFont(self.font)
        msg_box.exec()

    def open_file(self):
        #HAS ISSUES
        #drop down menu in the file picker takes up WAYY too much horizontal space
        video_exts = "*.mxf *.mkv *.ogm *.avi *.divx *.wmv *.mov *.rv *.mpg *.mpeg *.mp4 *.vob *.xvid *.asp *.m4v"
        audio_exts = "*.ogg *.mp3 *.wav *.ra *.ac3 *.dts *.aac *.m4a *.au *.aiff *.aif *.opus"
        subtitle_exts = "*.srt *.ssa *.ass *.smi"
        all_exts = " ".join([video_exts, audio_exts, subtitle_exts])
        file_filter = [
            f"Video files ({video_exts})",
            f"Audio files ({audio_exts})",
            f"Subtitle files ({subtitle_exts})",
            f"All supported files ({all_exts})",
            "All files (*)"
        ]
        file_dialog = QFileDialog()
        file_dialog.setNameFilters(file_filter)
        file_dialog.selectNameFilter(file_filter[3]) #"All supported files" is the default filter
        file_dialog.setFileMode(QFileDialog.FileMode.ExistingFile)
        file_dialog.exec_()
        filename = file_dialog.selectedFiles()
        filename = filename[0] if len(filename) == 1 else ""
        if filename:
            self.setWindowTitle (f"Mediainfo GUI - {filename}")
            self.data = get_mediainfo_data(filename)
            self.redraw_tabs()
