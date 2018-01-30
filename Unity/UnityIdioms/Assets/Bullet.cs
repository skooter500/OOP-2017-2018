using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet : MonoBehaviour {
    public float speed = 100.0f;
	// Use this for initialization
	void Start () {
        Invoke("KillMe", 5);
	}

    void KillMe()
    {
        Destroy(this.gameObject);
    }
	
	// Update is called once per frame
	void Update () {
        transform.Translate(0, 0, speed * Time.deltaTime);
	}
}
