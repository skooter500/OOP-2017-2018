using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ThirdPersonCamera : MonoBehaviour {
    public GameObject tank;
    public GameObject target;
    
    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        transform.position = Vector3.Lerp(transform.position
            , target.transform.position
            , Time.deltaTime * 5
            );

        transform.LookAt(tank.transform);
	}
}
