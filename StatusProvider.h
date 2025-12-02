#ifndef STATUSPROVIDER_H
#define STATUSPROVIDER_H

#include <qul/object.h>
#include <qul/property.h>

class StatusProvider : public Qul::Object
{
public:
    Qul::Property<int> cpuUsage;
    Qul::Property<uint32_t> stackUsage;
    Qul::Property<uint32_t> heapUsage;
    Qul::Property<uint32_t> fps;
    Qul::Property<uint64_t> renderTime;

    StatusProvider ()
    {
        cpuUsage.setValue(0);
        stackUsage.setValue(0);
        heapUsage.setValue(0);
        fps.setValue(0);
        renderTime.setValue(0);
    }

    void update(int cpu, uint32_t stack, uint32_t heap, uint32_t frames, uint64_t render_ms)
    {
        cpuUsage.setValue(cpu);
        stackUsage.setValue(stack);
        heapUsage.setValue(heap);
        fps.setValue(frames);
        renderTime.setValue(render_ms);
    }
};

#endif // STATUSPROVIDER_H
