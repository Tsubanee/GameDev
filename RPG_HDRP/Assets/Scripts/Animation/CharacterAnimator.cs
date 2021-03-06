﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class CharacterAnimator : MonoBehaviour
{
    public AnimationClip replecableAttackAnim;
    public AnimationClip[] defaultAtackAnimSet;
    protected AnimationClip[] currentAttackAnimSet;


    const float locomotionAnimationSmoothTime = .1f;

    protected Animator animator;
    protected CharacterCombat combat;
    public AnimatorOverrideController overrideController;
    NavMeshAgent agent;



    protected virtual void Start()
    {
        agent = GetComponent<NavMeshAgent>();
        animator = GetComponentInChildren<Animator>();
        combat = GetComponent<CharacterCombat>();

        if (overrideController == null)
        {
            overrideController = new AnimatorOverrideController(animator.runtimeAnimatorController);
        }

        
        animator.runtimeAnimatorController = overrideController;

        currentAttackAnimSet = defaultAtackAnimSet;
        combat.OnAttack += OnAttack;
    }

    // Update is called once per frame
    void Update()
    {
        float speedPercent = agent.velocity.magnitude / agent.speed;
        animator.SetFloat("speedPercent", speedPercent, locomotionAnimationSmoothTime, Time.deltaTime);

        animator.SetBool("inCombat", combat.InCombat);
    }


    protected virtual void OnAttack()
    {
        animator.SetTrigger("attack");
        int attackIndex = Random.Range(0, currentAttackAnimSet.Length);
        overrideController[replecableAttackAnim] = currentAttackAnimSet[attackIndex];
    }
}
