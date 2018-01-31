using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FPSController : MonoBehaviour {

    public float speed = 10;

    public void Walk(float units)
    {
        transform.Translate(0, 0, units);
    }

    public void Strafe(float units)
    {
        transform.Translate(units, 0, 0);        
    }

    public void Yaw(float units)
    {
        transform.Rotate(Vector3.up, units, Space.World);
    }

    public void Pitch(float units)
    {
        transform.Rotate(Vector3.right, units);
    }


	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        float vert = Input.GetAxis("Vertical");
        Walk(vert * speed * Time.deltaTime);

        float horiz = Input.GetAxis("Horizontal");
        Strafe(horiz * speed * Time.deltaTime);

        float mouseX = Input.GetAxis("Mouse X");
        Yaw(mouseX * speed * Time.deltaTime);
        float mouseY = Input.GetAxis("Mouse Y");
        Pitch(mouseY * speed * Time.deltaTime);


    }
}
