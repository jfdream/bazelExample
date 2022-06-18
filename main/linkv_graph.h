#ifndef LINKV_GRAPH_H_
#define LINKV_GRAPH_H_

#include <string>
#include <CoreVideo/CoreVideo.h>

namespace linkv {

class GraphCallback {

public:

    GraphCallback(){}
    
    virtual ~GraphCallback(){}

    virtual void OnImageFrameCallack(CVPixelBufferRef image) = 0;

};


class Graph {

public:
    ~Graph(){}

    Graph() {}
    
    static Graph *make(std::string& pbtxt, GraphCallback *delegate);

    virtual bool SendVideoFrame(CVPixelBufferRef pixelBuffer) {
        return true;
    }

    virtual bool Stop() {
        return true;
    }
};


}

#endif // LINKV_GRAPH_H_
