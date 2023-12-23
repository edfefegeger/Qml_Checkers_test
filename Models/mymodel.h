#ifndef MYMODEL_H
#define MYMODEL_H

#include <QAbstractItemModel>
#include <QList>
#include <QString>
#include <QObject>

class MyModel : public QAbstractItemModel
{
    Q_OBJECT
    Q_PROPERTY(int width READ width CONSTANT)
    Q_PROPERTY(int height READ height CONSTANT)
public:
    MyModel(const int&     width  = 8,
            const int&     height = 8,
                  QObject* parent = nullptr);

    struct fieldElement
    {
        QString color;
        int figure = {0};
    };

    int rowCount(const QModelIndex &parent) const override;
    int columnCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QModelIndex index(int row, int column, const QModelIndex &parent) const override;

    QModelIndex parent(const QModelIndex &child) const override;

    int width() const;
    int height() const;

private:

    int _width;
    int _height;
    QList <QString> _table;

};

#endif // MYMODEL_H
