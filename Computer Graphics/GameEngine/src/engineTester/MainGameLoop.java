package engineTester;

import models.RawModel;
import models.TexturedModel;
import org.lwjgl.opengl.Display;
import org.newdawn.slick.opengl.Texture;
import renderEngine.DisplayManager;
import renderEngine.Loader;
import renderEngine.Render;
import shaders.StaticShader;
import textures.ModelTexture;

public class MainGameLoop {

    public static void main(String[] args) {

        DisplayManager.createDisplay();

        Loader loader = new Loader();
        Render render = new Render();

        StaticShader shader = new StaticShader();

        float[] vertices = {
                -0.5f, 0.5f, 0, //V0
                -0.5f, -0.5f, 0, //V1
                0.5f, -0.5f, 0, //V2
                0.5f, 0.5f, 0  //V3
        };
        int[] indices = {
                0, 1, 3, //top left triangle (V0,V1,V3)
                3, 1, 2 //bottom right triangle (V3,V1,V2)
        };
        float[] textureCoords = new float[]{
                0.0f, 0.0f,
                0.0f, 1.0f,
                1.0f, 1.0f,
                1.0f, 0.0f};

        RawModel model = loader.loadToVAO(vertices, textureCoords, indices);
        ModelTexture texture = new ModelTexture(loader.loadTexture("image1"));
        TexturedModel texturedModel = new TexturedModel(model,texture);
        while (!Display.isCloseRequested()) {
            render.prepare();
            shader.start();

            render.render(texturedModel);
            shader.stop();
            DisplayManager.updateDisplay();
        }
        shader.cleanUp();
        loader.cleanUp();
        DisplayManager.closeDisplay();

    }
}
