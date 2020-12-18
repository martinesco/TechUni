package entities;

import org.lwjgl.input.Keyboard;
import org.lwjgl.util.vector.Vector3f;

public class Camera {

    private Vector3f position = new Vector3f(0, 0, 0);
    private float pitch;
    private float yaw;
    private float roll;

    public Camera() {
    }

    public void moveCamera() {

        if (Keyboard.isKeyDown(Keyboard.KEY_Z)) { // отдалечаване
            position.z -= 0.02f;
        }
        if (Keyboard.isKeyDown(Keyboard.KEY_R)) { // на дясно
            position.y += 0.02f;
        }
        if (Keyboard.isKeyDown(Keyboard.KEY_L)) { //на ляво
            position.x -= 0.02f;
        }
    }

    public Vector3f getPosition() {
        return position;
    }

    public float getPitch() {
        return pitch;
    }

    public float getYaw() {
        return yaw;
    }

    public float getRoll() {
        return roll;
    }

}
