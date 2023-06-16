import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.*;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;
import com.google.firebase.database.FirebaseDatabase;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import models.FirebaseBooks;
import services.CRUDBooks;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

public class MainApp extends Application {
    //define your offsets here
    private double xOffset = 0;
    private double yOffset = 0;

    public static void main(String[] args) throws IOException {
        FileInputStream serviceAccount = new FileInputStream("C:\\Users\\anand\\Desktop\\lmsIIITKalyani\\service-account-file.json");
        FirebaseOptions options = FirebaseOptions.builder()
                .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                .build();

        FirebaseApp.initializeApp(options);
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) throws IOException {
//        Parent root = FXMLLoader.load(getClass().getResource("borrowings.fxml"));
//
//
//        Scene scene = new Scene(root, 993, 616);
//
//        primaryStage.setTitle("FXML Welcome");
//        primaryStage.setScene(scene);
//        primaryStage.show();
        Parent root = FXMLLoader.load(getClass().getResource("/borrowings.fxml"));
        primaryStage.initStyle(StageStyle.TRANSPARENT);
//        root.setStyle(" -fx-background-image: url('images/background.jpg\')");

        //grab your root here
        root.setOnMousePressed(event -> {
            xOffset = event.getSceneX();
            yOffset = event.getSceneY();
        });

        //move around here
        root.setOnMouseDragged(event -> {
            primaryStage.setX(event.getScreenX() - xOffset);
            primaryStage.setY(event.getScreenY() - yOffset);
        });
        Scene scene = new Scene(root);
        try {
            scene.getStylesheets().add(getClass().getResource("/stylesheets/styles.css").toExternalForm());
        } catch (Exception e) {
            System.out.println(e);
        }
        //set transparent
        scene.setFill(Color.TRANSPARENT);
        primaryStage.setScene(scene);
        primaryStage.show();

    }
}
