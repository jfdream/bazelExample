#include "main/linkv_graph.h"
#include <stdio.h>

namespace linkv {

Graph * Graph::make(std::string& pbtxt, GraphCallback* callback) {
    Graph *graph;
    // GraphImpl *graph = new GraphImpl();
    // absl::Status status = graph->InitGraph(pbtxt, callback);
    // if (!status.ok()) return nullptr;
    return graph;
}

} // namespace mediapipe
