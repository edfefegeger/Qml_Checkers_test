#include "mymodel.h"

MyModel::MyModel(const int& width, const int& height, QObject* parent) :
    QAbstractItemModel(parent)
{
    _width = width;
    _height = height;
    for (int i = 0; i < height * width; ++i)
    {
//        QList<fieldElement> row;
//        for (int j = 0; j < width; ++j)
//        {
//            fieldElement fElement;

//            if (((i+j) % 2) == 0 )
//            {
//                fElement.color = "#000000";
//                if (i < 3)
//                    fElement.figure = 1;
//                else if (i >= _height - 3)
//                    fElement.figure = 2;
//            }
//            else
//                fElement.color = "#FFFFFF";



//            row.append(fElement);
//        }
//        _table.append(row);

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
//    if (!index.isValid() || (index.column() < _width && index.row() < _height))
//        return 0;

    int row = index.row();
    int column = index.column();

    switch(role)
    {
        case Qt::ItemDataRole::DisplayRole:
        {
//            QString result;

//            if (_table[row][column].color == "#FFFFFF")
//                result = "F";
//            else
//            {
//                if (!_table[row][column].figure)
//                    result = "0";
//                else if (_table[row][column].figure == 1)
//                    result = "B";
//                else if (_table[row][column].figure == 2)
//                    result = "W";
//            }

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
