package controllers;

import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class homeController implements Initializable {
    private double xOffset = 0;
    private double yOffset = 0;

    @FXML
    private Button recordsButton;

    @FXML
    private Button borrowingsButton;

    @FXML
    private Button finesButton;

    @FXML
    private Button magazinesButton;


    @FXML
    void handleNavigation(ActionEvent event) {
        Scene scene = ((Node) event.getSource()).getScene();
        AnchorPane recordsPane = null;
        AnchorPane borrowingsPane = null;
        AnchorPane finesPane = null;
        AnchorPane magazinesPane = null;
        try {
            recordsPane = (AnchorPane) FXMLLoader.load(getClass().getResource("/records.fxml"));
            borrowingsPane = (AnchorPane) FXMLLoader.load(getClass().getResource("/borrowings.fxml"));
            finesPane = (AnchorPane) FXMLLoader.load(getClass().getResource("/fines.fxml"));
            magazinesPane = (AnchorPane) FXMLLoader.load(getClass().getResource("/magazines.fxml"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (event.getSource() == recordsButton)
            scene.setRoot(recordsPane);
        else if (event.getSource() == borrowingsButton)
            scene.setRoot(borrowingsPane);
        else if (event.getSource() == finesButton)
            scene.setRoot(finesPane);
        else
            scene.setRoot(magazinesPane);
    }


    private void loadStage(String fxml) {
        try {
            Parent root = FXMLLoader.load(getClass().getResource(fxml));
            Stage primaryStage = new Stage();
            primaryStage.initStyle(StageStyle.TRANSPARENT);

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
            scene.getStylesheets().add(getClass().getResource("/stylesheets/styles.css").toExternalForm());
            //set transparent
            scene.setFill(Color.TRANSPARENT);
            primaryStage.setScene(scene);
            primaryStage.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public void exit(ActionEvent e) {
        Platform.exit();
        System.exit(0);
    }

    public void showDialog(ActionEvent e) {
        loadStage("/add_book.fxml");
//        Stage dialogStage = new Stage();
//        dialogStage.initModality(Modality.APPLICATION_MODAL);
//
//        VBox vbox = new VBox(new Text("Page Under construction"), new Button("Ok."));
//        vbox.setAlignment(Pos.CENTER);
//        vbox.setPadding(new Insets(150));
//
//        dialogStage.setScene(new Scene(vbox));
//        dialogStage.show();
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }
}
