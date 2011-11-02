package edison.alexis;

import android.app.Activity;
import android.app.Dialog;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class AlexisActivity extends Activity implements OnClickListener {
    /** Called when the activity is first created. */
	
	private Button loginButton;
	private EditText username, password;
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
       
        //Set Layout to XML layout "main.xml"
        setContentView(R.layout.main);
        
        //Link XML object to variable
        Button loginButton = (Button)findViewById(R.id.loginButton);
        //Set loginButton to be listened for clicks
        loginButton.setOnClickListener(this);
        
        //Link User/Pass fields to variables
        username = (EditText)findViewById(R.id.username);
        password = (EditText)findViewById(R.id.password);
      
    }

    //Click Listener Method
	@Override
	public void onClick(View v) {
		//Switch that gets the ID of the view that was clicked
		switch(v.getId())
		{
		case R.id.loginButton:
			if(checkCredentials())
				{
				TextView tv = new TextView(this);
				tv.setText("Successfully Logged In");
				setContentView(tv);
				}
			break;

		}
		
	}
	//Method checking credentials
	public boolean checkCredentials()
	{
		if(username.getText().toString().equals("test") && password.getText().toString().equals("password"))
			return true;
		else
			return false;
	}
	
	
    
}