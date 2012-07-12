package com.wikus.database;

import org.apache.cordova.DroidGap;

import android.os.Bundle;
import android.view.Menu;

public class DatabaseActivity extends DroidGap {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        super.loadUrl("file:///android_asset/www/index.html");
        //setContentView(R.layout.activity_database);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_database, menu);
        return true;
    }

    
}
