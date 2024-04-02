package com.javatest;

import processing.core.*;

import java.io.IOException;
import java.net.*;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class Main extends processing.core.PApplet {

    public static void main(String[] args) {
        PApplet.main("com.javatest.Main");
    }

    public void settings() {
        size(800, 600);
    }

    public void setup() {
        background(0);
        String joke;
        try {
            joke = HttpClient.newHttpClient().send(
                    HttpRequest.newBuilder(URI.create("https://api.chucknorris.io/jokes/random")).build(),
                    HttpResponse.BodyHandlers.ofString()).body();
        } catch (IOException e) {
            joke = "IOException";
            e.printStackTrace();
        } catch (InterruptedException e) {
            joke = "IOException";
            e.printStackTrace();
        }
        println(joke);
        text(joke, width / 2, height / 2);
    }

    public void draw() {
        fill(255);
        noStroke();
        ellipse(mouseX, mouseY, 80, 80);
    }
}