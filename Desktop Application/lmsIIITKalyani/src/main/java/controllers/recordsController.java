package controllers;

import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.ProgressIndicator;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.Pane;
import javafx.scene.shape.Line;
import models.FirebaseBooks;
import services.CRUDBooks;

import javafx.scene.input.MouseEvent;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class recordsController implements Initializable {

    ObservableList observableList = FXCollections.observableArrayList();
    ArrayList<FirebaseBooks> books = new ArrayList<>();
    ArrayList<String> bookTitles = new ArrayList<>();
    Thread newThread = null;

    @FXML
    private ProgressBar linearProgressindicator;

    @FXML
    private ProgressIndicator progressIndicator;

    @FXML
    private Label author, publisher, availability, language, categories, ratings, isbn10, isbn13, title, description;

    @FXML
    private Pane imagePane;

    @FXML
    private ImageView image;

    @FXML
    private Line line;

    @FXML
    private ListView bookList;

    boolean isLeftBarVisible = false;

    void showLeftBar(FirebaseBooks book) {
        line.setVisible(true);
        author.setVisible(true);
        publisher.setVisible(true);
        availability.setVisible(true);
        language.setVisible(true);
        categories.setVisible(true);
        ratings.setVisible(true);
        isbn10.setVisible(true);
        isbn13.setVisible(true);
        title.setVisible(true);
        description.setVisible(true);
        imagePane.setVisible(true);
        image.setVisible(true);
        isLeftBarVisible = true;

        image.setImage(new Image(book.imageLinks.get(1)));
        title.setText(book.title);
        description.setText(book.description);
        author.setText("Authors: " + (book.authors.size() == 0 ? "-" : book.authors));
        publisher.setText("Publisher: " + book.publisher);
        availability.setText("Availability: " + book.availability.toString());
        language.setText("Language: " + book.language);
        categories.setText("Categories: " + (book.categories.size() == 0 ? "-" : book.categories));
        ratings.setText("Ratings: " + book.averageRating);
        isbn10.setText("ISBN-10: " + (book.industryIdentifier.size() == 0 ? "-" : book.industryIdentifier.get(0)));
        isbn13.setText("ISBN-13: " + (book.industryIdentifier.size() == 1 ? "-" : book.industryIdentifier.get(1)));
    }

    void hideLeftBar() {
        line.setVisible(false);
        author.setVisible(false);
        publisher.setVisible(false);
        availability.setVisible(false);
        language.setVisible(false);
        categories.setVisible(false);
        ratings.setVisible(false);
        isbn10.setVisible(false);
        isbn13.setVisible(false);
        title.setVisible(false);
        description.setVisible(false);
        imagePane.setVisible(false);
        image.setVisible(false);
        isLeftBarVisible = false;
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        hideLeftBar();
        progressIndicator.setVisible(true);
        bookList.setVisible(false);
        linearProgressindicator.setVisible(false);
        new Thread(() -> {
            try {
                books = CRUDBooks.getBooks();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                Platform.runLater(() -> {
                    for (FirebaseBooks firebaseBooks : books) {
                        bookTitles.add(firebaseBooks.title);
                    }
                    bookList.getItems().clear();
                    observableList.removeAll();
                    observableList.addAll(bookTitles);
                    bookList.getItems().addAll(observableList);
                    loadBookListComplete();
                });
            }
        }).start();
        System.out.println("the thread is fetching data");
    }

    void loadBookListComplete() {
        progressIndicator.setVisible(false);
        bookList.setVisible(true);
    }


    public void displaySelected(MouseEvent mouseEvent) {
        String title = bookList.getSelectionModel().getSelectedItem().toString();
        setLeftBar(bookTitles.indexOf(title));
    }

    private void setLeftBar(int index) {
        linearProgressindicator.setVisible(true);
        new Thread(() -> {
            Platform.runLater(() -> {
                loadSideBarComplete(index);
            });
        }).start();
    }

    void loadSideBarComplete(int index) {
        FirebaseBooks book = books.get(index);
        linearProgressindicator.setVisible(false);
        showLeftBar(book);
    }
}
