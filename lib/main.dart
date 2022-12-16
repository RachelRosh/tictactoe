import 'package:flutter/material.dart';

void main() => runApp(TicTacToeApp());

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      home: TicTacToeHomePage(),
    );
  }
}

class TicTacToeHomePage extends StatefulWidget {
  @override
  _TicTacToeHomePageState createState() => _TicTacToeHomePageState();
}

class _TicTacToeHomePageState extends State<TicTacToeHomePage> {
  late List<List<String>> _board;
  late String _currentPlayer;

  @override
  void initState() {
    super.initState();
    _resetBoard();
  }

  void _resetBoard() {
    setState(() {
      _board = [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""],
      ];
      _currentPlayer = "X";
    });
  }

  void _playMove(int row, int col) {
    setState(() {
      if (_board[row][col] == "") {
        _board[row][col] = _currentPlayer;
        if (_currentPlayer == "X") {
          _currentPlayer = "O";
        } else {
          _currentPlayer = "X";
        }
      }
    });
  }

  Widget _buildBoard() {
    List<Row> rows = [];
    for (int i = 0; i < 3; i++) {
      List<Widget> columns = [];
      for (int j = 0; j < 3; j++) {
        columns.add(
          SizedBox(
            width: 100,
            height: 100,
            child: ElevatedButton(
              child: Text(_board[i][j], style: TextStyle(fontSize: 36)),
              onPressed: () => _playMove(i, j),
            ),
          ),
        );
      }
      rows.add(Row(children: columns));
    }
    return Column(children: rows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: _buildBoard(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: _resetBoard,
      ),
    );
  }
}
