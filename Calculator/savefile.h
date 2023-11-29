#ifndef SAVEFILE_H
#define SAVEFILE_H

#include <QObject>
#include <QFile>
#include <QDebug>

class SaveFile : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString file READ getFile WRITE setFile NOTIFY fileChanged FINAL)
public:
    SaveFile() {}

    QString getFile() const {
        return m_file;
    }

    void setFile(QString file) {
        m_file = file;
    }

signals:
    void fileChanged(QString file);

public slots:
    void appendFile(QString filename);
    void readFile(QString filename);
    void writeFile(QString filename);
    QString readFile_tmp(QString filename);
private:
    QString m_file;
};

#endif // SAVEFILE_H
