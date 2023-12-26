#include "mymodel.h"

MyModel::MyModel(const int& width, const int& height, QObject* parent) :
    QAbstractItemModel(parent)
{
    _width = width;
    _height = height;
    for (int i = 0; i < height * width; ++i)
    {
        _table.append(QString::number(i));
    }
}

int MyModel::rowCount(const QModelIndex& parent) const
{
    Q_UNUSED(parent)
    return _height * _width;
}

int MyModel::columnCount(const QModelIndex& parent) const
{
    Q_UNUSED(parent)
    return _width;
}

QVariant MyModel::data(const QModelIndex& index, int role) const
{
    int row = index.row();
    int column = index.column();

    switch(role)
    {
        case Qt::ItemDataRole::DisplayRole:
        {
            return _table[index.row()];
        }
    }
    return QString();
}

QModelIndex MyModel::index(int row, int column, const QModelIndex& parent) const
{
    Q_UNUSED(parent)
    return this->createIndex(row, column);
}

QModelIndex MyModel::parent(const QModelIndex& child) const
{
    Q_UNUSED(child)
    return QModelIndex();
}

int MyModel::width() const
{
    return _width;
}

int MyModel::height() const
{
    return _height;
}

int count = 0;
