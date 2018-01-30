using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Wall : MonoBehaviour {
    public GameObject prefab;

	// Use this for initialization
	void Start () {
        for (int i = -50; i < 50; i+=2)
        {
            GameObject brick = GameObject.Instantiate(prefab);
            brick.transform.position = new Vector3(i, 20, 0);
            brick.GetComponent<Renderer>().material.color =
                new Color(Random.Range(0.0f, 1.0f), Random.Range(0.0f, 1.0f), Random.Range(0.0f, 1.0f));
            // Parent the bricks so as not to clutter up the scene
            //brick.transform.parent = this.transform;
        }

	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
