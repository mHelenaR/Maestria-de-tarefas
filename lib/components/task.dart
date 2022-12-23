import 'package:blobonotas/components/difficulty.dart';
import 'package:blobonotas/data/task_dao.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  Task(
      {super.key,
      required this.nome,
      required this.foto,
      required this.dificuldade});
  int nivel = 0;
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(4),
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: assetOrNetwork()
                                ? Image.asset(
                                    'assets/images/${widget.foto}',
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    widget.foto,
                                    fit: BoxFit.cover,
                                  )),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Difficulty(difficultyLevel: widget.dificuldade),
                        ],
                      ),
                      SizedBox(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                          onLongPress: () {
                            TaskDAO().delete(widget.nome);
                          },
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: widget.dificuldade > 0
                              ? (widget.nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nivel ${widget.nivel}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
