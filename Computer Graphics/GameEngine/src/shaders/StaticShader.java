package shaders;

import entities.Camera;
import entities.Light;
import utilities.Mathematic;
import org.lwjgl.util.vector.Matrix4f;

public class StaticShader extends ShaderProgram {

    private static final String VERTEX_FILE = "E:\\Java\\GameEngine\\src\\shaders\\vertexShader.txt";
    private static final String FRAGMENT_FILE = "E:\\Java\\GameEngine\\src\\shaders\\fragmentShader.txt";

    private int locationOfTransformationMatrix;
    private int locationOfProjectionMatrix;
    private int locationOfViewMatrix;
    private int locationOfLightPosition;
    private int locationOfLightColour;


    public StaticShader() {
        super(VERTEX_FILE, FRAGMENT_FILE);
    }

    @Override
    protected void bindAttributes() {
        super.bindAttribute(0, "position");
        super.bindAttribute(1, "textureCoords");
        super.bindAttribute(2, "normal");
    }

    @Override
    protected void getAllUniformLocations() {
        locationOfTransformationMatrix= super.getUniformLocation("transformationMatrix");
        locationOfProjectionMatrix = super.getUniformLocation("projectionMatrix");
        locationOfViewMatrix = super.getUniformLocation("viewMatrix");
        locationOfLightPosition = super.getUniformLocation("lightPosition");
        locationOfLightColour = super.getUniformLocation("lightColour");
    }

    public void loadLight(Light light) {
        super.loadVector(locationOfLightPosition, light.getPosition());
        super.loadVector(locationOfLightColour, light.getColour());
    }

    public void loadTransformationMatrix(Matrix4f matrix) {
        super.loadMatrix(locationOfTransformationMatrix, matrix);
    }

    public void loadProjectionMatrix(Matrix4f projectionMatrix) {
        super.loadMatrix(locationOfProjectionMatrix, projectionMatrix);
    }

    public void loadViewMatrix(Camera camera) {
        Matrix4f matrix = Mathematic.createViewMatrix(camera);
        super.loadMatrix(locationOfViewMatrix, matrix);
    }


}
