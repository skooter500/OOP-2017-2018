using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet : MonoBehaviour {
    public float speed = 10;
	// Use this for initialization
	void Start () {
        // This means run the KillMe method after 5 seconds
        Invoke("KillMe", 5);
	}

    void KillMe()
    {
        GameObject.Destroy(this.gameObject);
    }
	
	// Update is called once per frame
	void Update () {
        transform.Translate(0, 0, speed * Time.deltaTime);
	}
}
