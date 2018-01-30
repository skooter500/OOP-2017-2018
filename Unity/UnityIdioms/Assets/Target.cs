using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Target : MonoBehaviour {

    void OnTriggerEnter(Collider other)
    {
        Debug.Log("Collison!!!");
        if (other.tag == "Bullet")
        {
            GameObject.Destroy(other.gameObject);
        }
    }

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
