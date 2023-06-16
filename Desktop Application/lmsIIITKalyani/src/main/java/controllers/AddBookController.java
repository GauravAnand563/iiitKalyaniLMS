package controllers;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

import java.net.URL;
import java.util.*;

public class AddBookController implements Initializable {
    public Button closeButton;
    @FXML
    Button submitButton;
    @FXML
    TextField availability;
    @FXML
    TextField title;
    @FXML
    TextField authors;
    @FXML
    TextField publisher;
    @FXML
    TextField publishedDate;
    @FXML
    TextArea description;
    @FXML
    TextField pageCount;
    @FXML
    TextField categories;
    @FXML
    TextField averageRating;
    @FXML
    TextField industryIdentifier;
    @FXML
    TextField imageLinks;
    @FXML
    TextField language;
    @FXML
    ProgressBar progressBar;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        availability.setText("4");
        title.setText("Hello world");
        description.setText("lorem ipsum dolor dsf dsfohf f fhdf fdsfj");
        pageCount.setText("500");
        imageLinks.setText("www.google.com; www.gaming.com");
        industryIdentifier.setText("454d4f;46464");
        language.setText("en");
        averageRating.setText("5.4");
        categories.setText("fiction;science");
        authors.setText("abc;dec;dfd");
        publisher.setText("wresnick halliday");
        publishedDate.setText("22-Mar-2021");

        progressBar.setVisible(false);
    }

    public void submitData(MouseEvent mouseEvent) {
        Map<String, Object> data = new HashMap<>();

//        try {
//
//        } catch (Exception e) {
//            System.out.println(e);
//        }
        data.put("availability", Integer.parseInt(availability.getText()));
        data.put("title", title.getText());
        data.put("categories", Arrays.asList(categories.getText().split(";")));
        data.put("authors", Arrays.asList(authors.getText().split(";")));
        data.put("industryIdentifier", Arrays.asList(industryIdentifier.getText().split(";")));
        data.put("imageLinks", Arrays.asList(imageLinks.getText().split(";")));
        data.put("publisher", publisher.getText());
        data.put("publishedDate", publishedDate.getText());
        data.put("pageCount", Integer.parseInt(pageCount.getText()));
        data.put("averageRating", Double.parseDouble(averageRating.getText()));
        data.put("language", language.getText());
        data.put("description", description.getText());
        Firestore db = FirestoreClient.getFirestore();
        disableAll();
        progressBar.setVisible(true);
        submitButton.setVisible(false);
        ApiFuture<DocumentReference> future = db.collection("books").add(data);
        progressBar.setVisible(false);
        submitButton.setVisible(true);
        clearAll();
        enableAll();
    }

    void clearAll() {
        title.clear();
        authors.clear();
        publisher.clear();
        publishedDate.clear();
        pageCount.clear();
        categories.clear();
        averageRating.clear();
        industryIdentifier.clear();
        imageLinks.clear();
        language.clear();
        description.clear();
        availability.clear();
    }

    void disableAll() {
        title.setDisable(true);
        authors.setDisable(true);
        publisher.setDisable(true);
        publishedDate.setDisable(true);
        pageCount.setDisable(true);
        categories.setDisable(true);
        averageRating.setDisable(true);
        industryIdentifier.setDisable(true);
        imageLinks.setDisable(true);
        language.setDisable(true);
        description.setDisable(true);
        availability.setDisable(true);
    }

    void enableAll() {
        title.setDisable(false);
        authors.setDisable(false);
        publisher.setDisable(false);
        publishedDate.setDisable(false);
        pageCount.setDisable(false);
        categories.setDisable(false);
        averageRating.setDisable(false);
        industryIdentifier.setDisable(false);
        imageLinks.setDisable(false);
        language.setDisable(false);
        description.setDisable(false);
        availability.setDisable(false);
    }

    public void exit(ActionEvent actionEvent) {
        Stage stage = (Stage) closeButton.getScene().getWindow();
        // do what you have to do
        stage.close();
    }
}
