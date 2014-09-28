import QtQuick 2.0

// Import Particle system
import QtQuick.Particles 2.0

Rectangle {
    id: root

    // Background
    width: 500; height: 600
    color:"#1f1f1f"

    // Define particle system
    ParticleSystem{
        id: particleSys
    }

    Emitter{
        id: emitter
        anchors.centerIn: parent
        width: 1; height: 1

        system: particleSys

//        velocity: AngleDirection{
//            angle: -45
//            angleVariation: 0

//            magnitude: 100
//        }
        acceleration: AngleDirection{
            angle:90
            magnitude: 25
        }

        // The rate that the particle system fire the particle.
        emitRate: 10
        // The life of each particle.
        lifeSpan: 6400
        lifeSpanVariation: 500
        size: 32
//        endSize: 32
//        Tracer{color:"green"}
    }

    ImageParticle{
        source:"./star.png"
        system:particleSys
        color:"#FFD700"
        colorVariation: 0.2

        rotation:15
        rotationVariation: 5

        // Rotate each second
        rotationVelocity: 45
        rotationVelocityVariation: 15

        entryEffect: ImageParticle.Scale
    }

}
