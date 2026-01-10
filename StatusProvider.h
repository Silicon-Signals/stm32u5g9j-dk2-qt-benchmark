#ifndef STATUSPROVIDER_H
#define STATUSPROVIDER_H

#include <qul/object.h>
#include <qul/property.h>

class StatusProvider : public Qul::Object
{
public:
    Qul::Property<int> cpuUsage;
    Qul::Property<uint32_t> ramUsage;
    Qul::Property<uint32_t> internalflashUsage;
    Qul::Property<uint32_t> externalflashUsage;
    Qul::Property<uint32_t> fps;
    Qul::Property<uint64_t> renderTime;

    StatusProvider ()
    {
        cpuUsage.setValue(0);
        ramUsage.setValue(0);
        internalflashUsage.setValue(0);
        externalflashUsage.setValue(0);
        fps.setValue(0);
        renderTime.setValue(0);
    }

    void update(int cpu, uint32_t RAM, uint32_t internalflash, uint32_t externalflash, uint32_t frames, uint64_t render_ms)
    {
        cpuUsage.setValue(cpu);
        ramUsage.setValue(RAM);
        internalflashUsage.setValue(internalflash);
        externalflashUsage.setValue(externalflash);
        fps.setValue(frames);
        renderTime.setValue(render_ms);
    }
};

#endif // STATUSPROVIDER_H
