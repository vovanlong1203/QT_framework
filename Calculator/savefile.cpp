#include "savefile.h"

void SaveFile::readFile(QString filename) {
    QFile file("E:/QT_Framework/bai1/append.txt");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "Can not open file for reading \n";
        return;
    }

    QTextStream in(&file);
    QString mytext = in.readAll();

    qDebug() << "Doc file : " << mytext;
    file.close();
    emit fileChanged(filename);
}

void SaveFile::writeFile(QString filename) {
    QFile file("E:/QT_Framework/bai1/write.txt");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "Can not open file for writing \n";
        return;
    }

    QTextStream out(&file);
    out << "Write file successfully";
    file.flush();
    file.close();
    emit fileChanged(filename);
}

void SaveFile::appendFile(QString filename) {
    QFile file("E:/QT_Framework/bai1/append.txt");

    if (!file.open(QIODevice::Append | QIODevice::Text)) {
        qDebug() << "can not open file for writing \n";
        return;
    }
    QTextStream out(&file);
    out << "\n" << filename ;
    qDebug() << filename << "\n";
    qDebug() << "append file successfully" ;

    file.close();
    emit fileChanged(filename);
}

QString SaveFile::readFile_tmp(QString filename) {
    QFile file("E:/QT_Framework/bai1/append.txt");
    QString error = "Can not open file for reading \n";
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "Can not open file for reading \n";
        return error;
    }

    QTextStream in(&file);
    QString mytext = in.readAll();
    QString str = mytext;
    qDebug() << "Doc file : " << mytext;
    file.close();
    emit fileChanged(filename);
    return str;
}
