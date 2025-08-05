from PyQt5.QtWidgets import QWidget, QVBoxLayout, QTabWidget, QScrollArea, QFormLayout, QLineEdit
import os

class tableWidget(QWidget):
    def __init__(self, parent, data, font):
        super().__init__(parent)
        self.font = font
        
        self.tabs = QTabWidget()
        self.tabs.clear()
        self.tabs.resize(300,200)

        general = data.get("general", {})
        audio = data.get("audio", {})
        video = data.get("video", {})
        image = data.get("image", {})
        other = data.get("other", {})

        if general:
            self.fill_tab("General", general)

        if audio:
            self.fill_tab("Audio", audio)

        if image:
            self.fill_tab("Image", image)

        if video:
            self.fill_tab("Video", video)

        if other:
            self.fill_tab("Other", other)

        self.layout = QVBoxLayout()
        self.layout.addWidget(self.tabs)
        self.setLayout(self.layout)

    def fill_tab(self, tab_name, tab_data):
        self.tab = QWidget()
        self.tabs.addTab(self.tab, tab_name)
        layout = QFormLayout()
        scroll_area = QScrollArea()
        scroll_area.setWidgetResizable(True)
        inner_widget = QWidget()
        for attribute, value in tab_data.items():
            attribute = attribute.replace("_", " ")
            attribute = attribute.capitalize()
            if attribute == "Track type": #skip redundant Track type attribute
                continue
            if attribute == "Complete name" and os.path.isabs(value): #strip path from "Complete attribute" value
                value = os.path.basename(value)
            LineEdit = QLineEdit()
            LineEdit.setFont(self.font)
            LineEdit.setReadOnly(True)
            LineEdit.setText(value)
            LineEdit.setCursorPosition(0)
            layout.addRow(f"{attribute}:", LineEdit)
            attribute_label = layout.labelForField(LineEdit)
            attribute_label.setFont(self.font)
        inner_widget.setLayout(layout)
        scroll_area.setWidget(inner_widget)
        tab_layout = QVBoxLayout()
        tab_layout.addWidget(scroll_area)
        self.tab.setLayout(tab_layout)
