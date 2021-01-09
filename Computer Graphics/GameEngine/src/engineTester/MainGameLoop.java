package engineTester;

import entities.Camera;
import entities.Entity;
import entities.Light;
import models.RawModel;
import models.TexturedModel;
import org.lwjgl.opengl.Display;
import org.lwjgl.util.vector.Vector3f;
import renderEngine.DisplayManager;
import renderEngine.Loader;
import renderEngine.ObjLoader;
import renderEngine.Render;
import shaders.StaticShader;
import textures.ModelTexture;

public class MainGameLoop {

    public static void main(String[] args) {

        DisplayManager.createDisplay();

        Loader loader = new Loader();
        StaticShader shader = new StaticShader();
        Render render = new Render(shader);


        RawModel model = ObjLoader.loadObjModel("child", loader);
        ModelTexture texture = new ModelTexture(loader.loadTexture("piel"));
        TexturedModel staticModel = new TexturedModel(model, texture);

        Entity entity = new Entity(staticModel, new Vector3f(-1.5f, -0.8f, -5), 0, 0, 5, 1); //view
        Light light = new Light(new Vector3f(0, 0, 10), new Vector3f(1, 1, 1));
        Camera camera = new Camera();

        while (!Display.isCloseRequested()) {

            entity.rotateEntity(0, 0, 0);

            render.prepare();
            shader.start();
            shader.loadLight(light);

            camera.moveCamera();

            shader.loadViewMatrix(camera); // !!!

            render.render(entity, shader);
            shader.stop();
            DisplayManager.updateDisplay();
        }
        shader.cleanUp();
        loader.cleanUp();
        DisplayManager.closeDisplay();

    }


}
