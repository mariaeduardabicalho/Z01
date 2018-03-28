# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'config_dialog.ui'
#
# Created by: PyQt5 UI code generator 5.10
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_Dialog(object):
    def setupUi(self, Dialog):
        Dialog.setObjectName("Dialog")
        Dialog.resize(482, 128)
        self.verticalLayout_2 = QtWidgets.QVBoxLayout(Dialog)
        self.verticalLayout_2.setObjectName("verticalLayout_2")
        self.verticalLayout = QtWidgets.QVBoxLayout()
        self.verticalLayout.setObjectName("verticalLayout")
        self.formLayout = QtWidgets.QFormLayout()
        self.formLayout.setObjectName("formLayout")
        self.label = QtWidgets.QLabel(Dialog)
        self.label.setObjectName("label")
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.LabelRole, self.label)
        self.assemblerLineEdit = QtWidgets.QLineEdit(Dialog)
        self.assemblerLineEdit.setObjectName("assemblerLineEdit")
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.FieldRole, self.assemblerLineEdit)
        self.alterarButton = QtWidgets.QPushButton(Dialog)
        self.alterarButton.setObjectName("alterarButton")
        self.formLayout.setWidget(4, QtWidgets.QFormLayout.FieldRole, self.alterarButton)
        self.procurarButton = QtWidgets.QPushButton(Dialog)
        self.procurarButton.setObjectName("procurarButton")
        self.formLayout.setWidget(4, QtWidgets.QFormLayout.LabelRole, self.procurarButton)
        self.label_2 = QtWidgets.QLabel(Dialog)
        self.label_2.setObjectName("label_2")
        self.formLayout.setWidget(3, QtWidgets.QFormLayout.LabelRole, self.label_2)
        self.simGUIBox = QtWidgets.QCheckBox(Dialog)
        self.simGUIBox.setObjectName("simGUIBox")
        self.formLayout.setWidget(3, QtWidgets.QFormLayout.FieldRole, self.simGUIBox)
        self.verticalLayout.addLayout(self.formLayout)
        self.verticalLayout_2.addLayout(self.verticalLayout)

        self.retranslateUi(Dialog)
        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):
        _translate = QtCore.QCoreApplication.translate
        Dialog.setWindowTitle(_translate("Dialog", "Dialog"))
        self.label.setText(_translate("Dialog", "Comando (Assembler):"))
        self.alterarButton.setText(_translate("Dialog", "Alterar"))
        self.procurarButton.setText(_translate("Dialog", "Procurar"))
        self.label_2.setText(_translate("Dialog", "Opções"))
        self.simGUIBox.setText(_translate("Dialog", "Abrir GUI do Modelsim após simular"))

