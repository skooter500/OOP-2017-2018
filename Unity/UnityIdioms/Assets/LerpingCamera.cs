using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LerpingCamera : MonoBehaviour {
    public GameObject lerpingTarget;


    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        transform.position = Vector3.Lerp(transform.position, lerpingTarget.transform.position, Time.deltaTime * 2.0f);
        transform.LookAt(lerpingTarget.transform.parent);
	}
}
